package main

import (
	"fmt"
	"io/ioutil"

	"github.com/gin-gonic/gin"
)

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()
	r.Any("/*proxyPath", func(c *gin.Context) {
		url := c.Request.URL.String()
		fmt.Printf("url: %s\n", url)
		fmt.Println("header:")
		for h, val := range c.Request.Header {
			fmt.Printf("%s: %v\n", h, val)
		}
		body, _ := ioutil.ReadAll(c.Request.Body)
		fmt.Printf("body: \n%s\n", body)
		c.Status(200)
	})
	r.Run(":8080")
}
