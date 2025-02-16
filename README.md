# Kogge-Stone_Adders_with_all_configurations


# Kogge-Stone Adder (KSA) Overview
The Kogge-Stone Adder (KSA) is a parallel-prefix adder known for its high-speed performance and efficient carry propagation. It is widely used in high-performance computing, digital signal processing (DSP), and processor ALUs due to its logarithmic time complexity 
𝑂(log2𝑛), making it much faster than conventional ripple-carry adders.

The below picture shows the abstract view of parallel prefix adders
![image](https://github.com/user-attachments/assets/07d2796b-14a9-47e5-833e-2063231b9620)

# General Architecture
The Kogge-Stone Adder consists of three major steps:

* Preprocessing Stage

Compute the Generate (G) and Propagate (P) signals for each bit of the operands.

    Gi = Ai ⋅ Bi 
    Pi = Ai ⊕ Bi 

* Carry signals Computation:

      Gi:j = Gi:k + Pi:k ⋅ Gk-1:j 
      Pi:j  = Pi:k ⋅ Pk-1:j

    Irrespective of the previous carry, the generation and propagation bits are being computed.

* Sum Evaluation: As all the carry bits are ready in advance, all the sum bits are evaluated in parallel.

  
				Si = Pi ⊕ Gi-1 


the black cells and gray cells are :


![image](https://github.com/user-attachments/assets/1116cb66-e0ef-4a63-ab2c-97dc8e488679)   ![image](https://github.com/user-attachments/assets/98d073d0-8660-429e-85f6-e0ee7f43156e)

The basic 8-bit Kogge-Stone Architecture:


![image](https://github.com/user-attachments/assets/ef7fcc4f-d8a9-4cf3-9904-1a1d1c338e89)





