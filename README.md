# OpenGL-Vertex-Calculator:

</br>

```ruby
Compiler    : Delphi10 Seattle, 10.1 Berlin, 10.2 Tokyo, 10.3 Rio, 10.4 Sydney, 11 Alexandria, 12 Athens
Components  : None
Discription : OpenGL Vertex Calculator
Last Update : 10/2025
License     : Freeware
```

</br>

In OpenGL, [Vertex information](https://en.wikipedia.org/wiki/Vertex) is data about the points that make up a shape, such as position, color, and texture coordinates. This data is stored efficiently in [Vertex Buffer Objects](https://de.wikipedia.org/wiki/Vertex_Buffer_Object) (VBOs), which are sent to the GPU and organized using Vertex Array Objects (VAOs). An Index Buffer Object (IBO) can be used to specify the order in which vertices are drawn, reducing redundant data. 

</br>

### Features
* Adjust Colors
* Adjust Vertex Points
* Render Bitmap or Frames
* Select Style
* Get Vertex Data

</br>

![OpenGL Vertex](https://github.com/user-attachments/assets/48c44021-e530-436e-84f4-8d27b3218bd4)

</br>

A vertex buffer object (VBO) is an [OpenGL](https://en.wikipedia.org/wiki/OpenGL) feature that provides methods for uploading vertex data (position, normal vector, color, etc.) to the video device for non-immediate-mode rendering. VBOs offer substantial performance gains over [immediate mode rendering](https://en.wikipedia.org/wiki/Immediate_mode_(computer_graphics)) primarily because the data reside in video device memory rather than system memory and so it can be rendered directly by the video device. These are equivalent to [vertex buffers](https://en.wikipedia.org/wiki/Glossary_of_computer_graphics#vertex_buffer) in [Direct3D](https://en.wikipedia.org/wiki/Direct3D).

### Key components for vertex information:
* [Vertex Buffer Object](https://en.wikipedia.org/wiki/Vertex_buffer_object) (VBO): This is a buffer stored in the GPU's memory that holds the raw vertex data, such as coordinates, normals, and colors. Storing data in a VBO and sending it to the GPU once dramatically increases rendering performance compared to sending it for every frame.
    * VBOs are created and filled with data using glGenBuffers and glBufferData.
    * Binding a VBO to ```GL_ARRAY_BUFFER``` makes it the active source for vertex attributes.
* [Element Buffer Object](https://wikis.khronos.org/opengl/Buffer_Object) (EBO): Also known as an Index Buffer Object (IBO), an EBO is an optional buffer that stores indices. Instead of repeating vertex data for every triangle, the EBO specifies the order in which to draw the vertices. This saves memory and is more efficient for complex meshes where vertices are shared by multiple primitives.
* [Vertex Array Object](https://en.wikipedia.org/wiki/Vertex_(computer_graphics)) (VAO): An object that stores the configuration of vertex attribute pointers. It essentially bundles together the VBOs and their associated state for rendering. This object acts as a container for all the state needed to manage vertex data. A VAO stores references to one or more VBOs and an EBO, along with the layout of the vertex attributes (e.g., how the data is structured within the buffer). By binding a VAO, you can quickly switch between different mesh configurations without re-specifying all the vertex attributes individually.
    * A VAO is generated with ```glGenVertexArray``` and activated with ```glBindVertexArray```.
    * Once a VAO is bound, subsequent calls to glVertexAttribPointer and glEnableVertexAttribArray will be recorded within that VAO.
* Index Buffer Object (IBO): An optional buffer that contains the indices of the vertices to be drawn, specifying the order in which the GPU should use the vertices from the VBO.
    * This is useful for drawing complex shapes with fewer vertices and for using shared vertices.
    * An IBO is bound to ```GL_ELEMENT_ARRAY_BUFFER```.
* Vertex Attributes: Individual pieces of data within a vertex, such as \(x,y,z\) coordinates, normal vectors, or RGBA color values.
   * Each attribute is associated with a specific index and is configured using ```glVertexAttribPointer```.
   * ```glEnableVertexAttribArray``` must be called to activate each attribute before it can be used by the vertex shader. 
 * Vertex Attributes: These are the specific pieces of data associated with each vertex. In the vertex shader, you define an input variable for each attribute, which can include:
    * Position: The 3D coordinates (\(x,y,z\)) of the vertex in space.
    * Color: The color (\(r,g,b,a\)) of the vertex.
    * Normal: A 3D vector used for lighting calculations to determine which way a surface is facing.
    * Texture Coordinates: 2D coordinates (\(u,v\)) that map a texture image to the vertex.





