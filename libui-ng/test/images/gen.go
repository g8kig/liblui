// 25 june 2016
package main

import (
	"fmt"
	"os"
	"image"
	"image/draw"
	_ "image/png"
)

type img struct {
	filename	string
	data		[]byte
	width	int
	height	int
	stride	int
}

func main() {
	if len(os.Args[1:]) == 0 {
		panic("no files specified")
	}

	images := make([]*img, 0, len(os.Args[1:]))
	for _, fn := range os.Args[1:] {
		f, err := os.Open(fn)
		if err != nil {
			panic(err)
		}
		ii, _, err := image.Decode(f)
		if err != nil {
			panic(err)
		}
		f.Close()

		i := image.NewRGBA(ii.Bounds())
		draw.Draw(i, i.Rect, ii, ii.Bounds().Min, draw.Src)

		im := &img{
			filename:		fn,
			data:			i.Pix,
			width:		i.Rect.Dx(),
			height:		i.Rect.Dy(),
			stride:		i.Stride,
		}
		images = append(images, im)
	}

	fmt.Println("// auto-generated by images/gen.go")
	fmt.Println("#include \"test.h\"")
	fmt.Println()
	for i, im := range images {
		fmt.Printf("static const uint8_t dat%d[] = {", i)
		for j := 0; j < len(im.data); j++ {
			if (j % 16) == 0 {
				fmt.Printf("\n\t")
			} else {
				fmt.Printf(" ")
			}
			fmt.Printf("0x%02X,", im.data[j])

		}
		fmt.Println("\n};")
		fmt.Println()
	}
	fmt.Println("static const struct {")
	fmt.Println("	const char *name;")
	fmt.Println("	void *data;")
	fmt.Println("	int width;")
	fmt.Println("	int height;")
	fmt.Println("	int stride;")
	fmt.Println("} files[] = {")
	for i, im := range images {
		fmt.Printf("	{ %q, dat%d, %d, %d, %d },\n",
			im.filename, i, im.width, im.height, im.stride)
	}
	fmt.Println("};")
	fmt.Println()
	fmt.Println("void appendImageNamed(uiImage *img, const char *name)")
	fmt.Println("{")
	fmt.Println("	int i;")
	fmt.Println("")
	fmt.Println("	i = 0;")
	fmt.Println("	for (;;) {")
	fmt.Println("		if (strcmp(name, files[i].name) == 0) {")
	fmt.Println("			uiImageAppend(img, files[i].data, files[i].width, files[i].height, files[i].stride);")
	fmt.Println("			return;")
	fmt.Println("		}")
	fmt.Println("		i++;")
	fmt.Println("	}")
	fmt.Println("}")
	fmt.Println()
}
