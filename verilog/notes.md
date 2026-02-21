## Combinational Logic
Outputs are a simple function of inputs

## Sequential Logic
Outputs are a function of both inputs and internal state


## Icarus Verilog
```wire``` - represents a physical connection. It has a value at all times driven by what is connected with it. ```assign```
statements and gate primitives drive wires.

```reg``` - represents a storage element. It holds a value until explicitly assigned a new one. ```always``` blocks drive regs.

```always``` blocks are procedural, so it requires ```reg```. It runs conditionally and assigned values based on logic,
rather than continuously driving a signal. The signal needs to to be able to hold whatever value was last assigned to it, which is what ```reg``` does.

The rule of thumb is simple: if a signal is assigned inside an ```always``` block, it must be declared as ```reg```. If it's driven by an 
```assign``` statement or gate primitive, it's a ```wire``` (which is default, and not required to be written out).

It's worth noting that the ```reg``` keyword doesn't mean there is a physical register or flip-flop in the hardware. It just tells the simulator
"this signal is driven procedurally". System Verilog actually replaces ```reg``` with ```logic``` to avoid confusion.