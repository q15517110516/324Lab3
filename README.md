# Lab 3: A Single-CycleCalculatorin VHDL
## Objective
The objective of this laboratory is to implement acalculator based on your calculator ISA design.Moreover, you should develop a VHDL testbench to test the functionality and verify the correctness of your implementation with VHDL simulation.
## Specification of the calculator
The calculatorshould have9input ports(think the inputs as “buttons” or “switches”)in total. You should implement the 8-bit ISA you designed in the first lab on the board. The 8-bit instruction words should be mapped to 8 of the 9inputs, and you should use one of the inputsfor clock signal. You can choose to include an optional“RESET” input to your calculator entity. Remember that your ISA is required to have a display instruction. For that instruction, the content should be displayed on screen.Note: the display instruction is the ONLY operationthat outputs anythingon the screen. No hackingprintout from your calculatorinternal is allowed.

All numbers are displayed in decimal formatwith4-digit, even though the operands are readfrom the input portsas binary numbers. For example, if the content to displayis “0101”, the 4-digit display should read as “[empty][empty][empty]5”. 

You should adapt your implementation of the adder/subtractor from the previous lab in this work. You can make necessary and reasonable changes to your code, but the base line is that you cannot directly use the “+” and “-“ operators in VHDL todo the adding or the subtracting.The subtractoperationmight produce negative results, and you should display the result as negative. For example, if the two inputs are “0010” and “1111”, when the “add” functionis invoked, the display should read “[empty][empty]17”. For the same inputs, when the “sub” functionis invoked, the display should read “[empty] –1 3”.

## Circuit  Design
You  should  first  design  a  single-cycle  datapath+controllercircuit  for  your calculator.IMPORTANT:The diagram should illustrate the circuit at RTL level, and contain sufficient details about main gate-level components such as registers, mux and demux.In particular, the diagram should clearly label signal connections and datapath width. 

You design, as well as implementation, should have a clear distinction between the datapath and the controller. In other words, the controller should be represented as a separate component in your design, and in its VHDL implementation, as a separate entity.

You should have the diagram readyby Apr. 26for the presentation.On the presentation day, all teams are expected to showcase their calculator design in a 5-minute presentation. You are expected to briefly describe your circuitschema, on blackboard or withslides.If you prefer, you canalso present your design earlier (making an appointment with the instructor for that).

The design presentation and the final circuit design submitted in your lab report willtogetheraccount for 40% of your gradesin this lab project.

## Testbench
You should writea VHDL testbench that test ALLinstructions that your calculator implements. The testbench should load your ISA testbench from Lab 1, drive the input ports, and we should be able tell whether your implementation is correct or not by examining what the display instructions display on screen. Remember that you CANNOTuse hackingprintout to prove correctness.

## Use synthesizable features of VHDL (IMPORTANT)
You should only use the synthesizable features of VHDL. If your code doesn’t conform to the following requirements, the score for that part of code will be zero. Note that the following requirements only apply to the implementation part. You can use ANY features in your test benches. In the implementation of your displayinstruction, you might need to do I/O operations and number formatting. Therefore, you don’t need to abide by the following rule (1) in the implementation of the display instruction.

VHDL feature requirements:
  * No variables are allowed;
  * Up to one "wait" statement OR a sensitivity list is allowed in a process. 
  * A process should wait on (using a “wait” statement or the sensitivity list) either 
    * ALL signals appearing on the right-hand-side in the process body; or 
    * the clock signal or with the optional reset signal.
  * No "wait for" statements or time expressions in signal assignment statements.
