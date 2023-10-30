Este prototipo básico de procesador ha sido desarrollado con el propósito de ilustrar y vailidar
las capacidades de IIC-OSIC-TOOLS (https://github.com/iic-jku/IIC-OSIC-TOOLS) como entorno para
el desarrollo de circuitos integrados. La arquitectura está basada en RISC-V (https://riscv.org/)
y ha sido diseñado a partir de los conceptos tratados en la serie de videotutoriales
(https://www.youtube.com/playlist?list=PLSUmB2yTypWGcPlfTymmaQ3HWxvamxfoW) impartidos por el
prfesor Felipe Machado de la Universidad Rey Juan Carlos.

El uso de estos archivos es completamente libre.

---------------------------------------------------------------------------------------------------

En la carpeta HDL_description pueden encontrarse las descripciones, los testbenches y los
resultados de simulación de cada uno de los módulos desarrollados.

En la carpeta Images se incluyen todas las ilustraciones del proyecto en formato .jpg y .png.

En la carpeta OPENLANE_digital_flow pueden encontrarse los archivos generados para la ejecución
del flujo de diseño digital y sus resultados.

---------------------------------------------------------------------------------------------------

CARACTERÍSTICAS DEL PROCESADOR:

Procesador monociclo. Acciones del registro de datos, la memoria de datos y el contador de programa
sincronizados con una señal de reloj.Registro de datos (32 espacios de memoria de 32 bits cada uno)
con un puerto de escritura y dos de lectura. Memoria de datos (256 espacios de memoria de 32 bits
cada uno) con un puerto de escritura y uno de lectura.

El testbench "sistem_tb.v" actúa como ensamblador y memoria ROM de la que el procesador tomará las
instrucciones a ejecutar.


INSTRUCCIONES DEL PROCESADOR:

El procesador puede realizar 33 instrucciones diferentes:
	Tipo R: add, sub, and, or, xor, slt, sltu, sll, srl, sra.
	Tipo I: addi, andi, ori, xor, slti, sltui, slli, srli, srai, lb, lh, lw, lbu, lhu.
	Tipo S: sb, sh, sw.
	Tipo B: beq, bne, blt, bge, bltu, bgeu.

Las instrucciones serán introducidas línea a linea en "test_program.txt" y la simulación de
"sistem_tb.v" mostrará el resultado.

El formato de la instrucciones es:
	Tipo R: mnemónico rd rs1 rs2
	Tipo I: mnemónico rd rs1 imm
	Tipo S: mnemónico rs2 rs1 offset
	Tipo B: mnemónico rs1 rs2 offset

La memoria ROM está alineada, por lo que el offset en las instrucciones de tipo B debe ser
un múltiplo de 4 (cada salto de línea equivale a sumar 4 al contador de programa). La memoria
de datos no está alineada, por lo que cada espacio de memoria está etiquetado desde el 0 al 255.

