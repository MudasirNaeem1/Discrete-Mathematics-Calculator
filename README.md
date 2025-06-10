# ➕ ➖ DISCRETE MATHEMATICS CALCULATOR ✖️ ➗ 

<div align="center">

![Assembly-Language](https://img.shields.io/badge/Assembly%20Language-x86-FF6B35?style=for-the-badge&logo=assemblyscript&logoColor=white)
![Visual Studio](https://img.shields.io/badge/Visual%20Studio-5C2D91?style=for-the-badge&logo=visual-studio&logoColor=white)
![Irvine32](https://img.shields.io/badge/Irvine32-Library-4CAF50?style=for-the-badge)
![MASM](https://img.shields.io/badge/MASM-Assembler-FF9800?style=for-the-badge)

Assembly Language Implementation with Irvine32 Library

</div>

---

## 🎯 **Project Overview**

> A comprehensive **Assembly Language** calculator implementing various discrete mathematics operations using the **Irvine32 library**. This project demonstrates low-level programming concepts and mathematical computations in x86 assembly.

```mermaid
graph TB
    A[🏠 Main Menu] --> B[📝 Logic Expression]
    A --> C[📊 Series Generation]
    A --> D[📋 Truth Table]
    A --> E[🔐 Caesar Cipher]
    A --> F[🔢 Numeric Operations]
    
    B --> B1[Sentence to Logic]
    C --> C1[AP/GP Series]
    D --> D1[2-3 Variables]
    E --> E1[Encrypt/Decrypt]
    F --> F1[Base Conversion]
    F --> F2[Arithmetic Operations]
    
    style A fill:#ff9999,stroke:#333,stroke-width:3px
    style B fill:#99ccff,stroke:#333,stroke-width:2px
    style C fill:#99ff99,stroke:#333,stroke-width:2px
    style D fill:#ffcc99,stroke:#333,stroke-width:2px
    style E fill:#ff99cc,stroke:#333,stroke-width:2px
    style F fill:#ccff99,stroke:#333,stroke-width:2px
```

---

## 🌟 **Features**

<table>
<tr>
<td width="50%">

### 💯 **Core Functionalities**
- 📝 **Logic Expression Converter**
  - Sentence to logical expressions
  - Support for AND, OR, IF-ONLY-IF operations
- 📊 **Series Generator**
  - Arithmetic Progression (AP)
  - Geometric Progression (GP)
- 📋 **Truth Table Generator**
  - 2-3 variable support
  - Complete truth table generation

</td>
<td width="50%">

### 🔧 **Advanced Operations**
- 🔐 **Caesar Cipher**
  - Text encryption/decryption
  - Custom key rotation
- 🔢 **Number System Converter**
  - Binary ↔ Decimal ↔ Hexadecimal
  - Addition/Subtraction operations
- 🎨 **Interactive Menu System**
  - User-friendly interface
  - Error handling

</td>
</tr>
</table>

---

## 🛠️ **System Requirements**

<div align="center">

| Component | Requirement | Status |
|-----------|-------------|---------|
| **OS** | Windows 10/11 | ✅ Required |
| **IDE** | Visual Studio 2019/2022 | ✅ Required |
| **Assembler** | MASM (Microsoft Macro Assembler) | ✅ Required |
| **Library** | Irvine32.lib | ✅ Required |
| **Architecture** | x86 (32-bit) | ✅ Required |
| **RAM** | 4GB+ | Recommended |

</div>

### 📦 **Prerequisites Installation**

```mermaid
graph LR
    A[💻 Install Visual Studio] --> B[📥 Download Irvine32]
    B --> C[⚙️ Configure MASM]
    C --> D[🔧 Setup Include Path]
    D --> E[✅ Ready to Build]
    
    style A fill:#e1f5fe
    style B fill:#f3e5f5
    style C fill:#fff3e0
    style D fill:#e8f5e8
    style E fill:#ffebee
```

---

## 🚀 **Installation & Setup**

### **Step 1: Visual Studio Setup**
```bash
# Download Visual Studio Community (Free)
https://visualstudio.microsoft.com/downloads/

# Install with following components:
- MSVC v143 compiler toolset
- Windows 10/11 SDK
- MASM (Microsoft Macro Assembler)
```

### **Step 2: Project Configuration**

<details>
<summary><b>🔧 Visual Studio Configuration Steps</b></summary>

1. **Create New Project**
   - File → New → Project
   - Select "Empty Project" 
   - Name: `DiscreetMathCalculator`

2. **Configure Project Properties**
   ```
   Configuration Properties → VC++ Directories
   ├── Include Directories: C:\Irvine
   ├── Library Directories: C:\Irvine
   └── 
   
   Linker → Input → Additional Dependencies:
   ├── irvine32.lib
   ├── user32.lib
   └── kernel32.lib
   
   Microsoft Macro Assembler → General:
   └── Include Paths: C:\Irvine
   ```

3. **Add Source File**
   - Right-click Source Files → Add → New Item
   - Select "C++ File (.cpp)" 
   - Change extension to `.asm`
   - Paste the provided code

</details>

---

## 🎮 **How to Run**

### ** Visual Studio** (Recommended)
```assembly
; 1. Open Visual Studio
; 2. Load the project file (.sln)
; 3. Set configuration to x86 Debug
; 4. Press F5 or Ctrl+F5 to run
```

### **Alternative IDEs**

<div align="left">

| IDE | Compatibility | Setup Difficulty | Performance |
|-----|---------------|------------------|-------------|
| **Visual Studio** | ✅ Excellent | Easy | Fast |
| **SASM** | ✅ Good | Easy | Good |
| **RadASM** | Advanced | Hard | Fast |

</div>

---

## 📖 **Usage Guide**

### **🏠 Main Menu Navigation**
```
========================================================
               DISCRETE MATHEMATICS CALCULATOR                                                       
========================================================

    1. CONVERTING SENTENCE INTO LOGIC EXPRESSION  
    2. GENERATE SERIES 
    3. GENERATING TRUTH TABLE
    4. Caesar Encryption and Decryption
    5. FOR CONVERSION AND PERFORM OPERATIONS
    0. QUIT

    Please Enter the Suitable Option From the Above:
```

### **🔧 Feature Demonstrations**

<details>
<summary><b>📝 Logic Expression Converter</b></summary>

**Input Example:**
```
Enter Sentence to Convert into Logical Expression: 
> The sky is blue AND the grass is green

Output:
LET P = The sky is blue
    Q = the grass is green
LOGICAL EXPRESSION: P & Q
```

</details>

<details>
<summary><b>📊 Series Generator</b></summary>

**Arithmetic Progression:**
```
Enter the first term (a): 5
Enter the common difference (d): 3
Enter the number of terms (n): 6
Enter 1 for AP, 2 for GP: 1

Output: 5,8,11,14,17,20
```

**Geometric Progression:**
```
Enter the first term (a): 2
Enter the ratio (r): 3
Enter the number of terms (n): 5
Enter 1 for AP, 2 for GP: 2

Output: 2,6,18,54,162
```

</details>

<details>
<summary><b>📋 Truth Table Generator</b></summary>

**Input:**
```
ENTER THE EXPRESSION FOR TRUTH TABLE: P+Q
```

**Output:**
```
P | Q | P+Q
=============
T | T | T
T | F | T  
F | T | T
F | F | F
```

</details>

---

## 🔓 **Code Structure**

```mermaid
graph TD
    A[main.asm] --> B[Main Menu Loop]
    B --> C[Function 1: Sentence_To_Logic]
    B --> D[Function 2: Series]
    B --> E[Function 3: Generating_Truth_Table]
    B --> F[Function 4: Shift_Cipher]
    B --> G[Function 5: Numeric_operations]
    
    C --> C1[String Processing]
    C --> C2[Logic Conversion]
    
    D --> D1[AP Generation]
    D --> D2[GP Generation]
    
    E --> E1[Variable Counting]
    E --> E2[Truth Evaluation]
    
    F --> F1[Encryption]
    F --> F2[Decryption]
    
    G --> G1[Base Conversion]
    G --> G2[Arithmetic Ops]
    
    style A fill:#ff6b6b,color:#fff
    style B fill:#4ecdc4,color:#fff
    style C fill:#45b7d1,color:#fff
    style D fill:#96ceb4,color:#fff
    style E fill:#feca57,color:#fff
    style F fill:#ff9ff3,color:#fff
    style G fill:#54a0ff,color:#fff
```

---

## 📌 **Testing Examples**

### **Test Case 1: Logic Expression**
```assembly
Input: "The sun is bright OR the moon is visible"
Expected: P V Q where P="The sun is bright", Q="the moon is visible"
```

### **Test Case 2: Caesar Cipher**
```assembly
Input: "HELLO" with key rotation
Expected: Encrypted output based on rotation pattern
```

### **Test Case 3: Number Conversion**
```assembly
Input: Decimal 255
Expected: Binary 11111111, Hex FF
```

---

## 🤝 **Contributors**

<div align="left">

<table>
<tr>
<td align="center">
<img src="https://github.com/identicons/mudasir.png" width="100px;" alt="Mudasir Naeem"/><br>
<b>🎓 MUDASIR NAEEM</b><br>
<sub>22K-8732</sub><br>
<a href="mailto:mudasirnaeem000@gmail.com">📧</a>
</td>
<td align="center">
<img src="https://github.com/identicons/irteza.png" width="100px;" alt="Irteza Ishaq"/><br>
<b>🎓 IRTEZA ISHAQ</b><br>
<sub>22K-8731</sub><br>
<a href="mailto:k228731@nu.edu.com">📧</a>
</td>
</tr>
</table>

**Course:** BAI-4A | **Semester:** Spring 2024  
**Subject:** Computer Organization & Assembly Language (COAL LAB)

</div>

---

## 🏁 **Troubleshooting**

<details>
<summary><b>❌ Common Issues & Solutions</b></summary>

### **Build Errors**
```
Error: Cannot find Irvine32.inc
Solution: Check include path in project properties
```

### **Linker Errors**
```
Error: Unresolved external symbol
Solution: Add irvine32.lib to additional dependencies
```

### **Runtime Errors**
```
Error: Access violation
Solution: Check array bounds and memory allocation
```

### **Assembly Errors**
```
Error: Invalid instruction
Solution: Ensure x86 target platform is selected
```

</details>

---

## 📚 **Educational Value**

This project demonstrates:

- **🔧 Low-level Programming**: Direct hardware interaction
- **💯 Algorithm Implementation**: Mathematical operations in assembly
- **📊 Data Structures**: Array and string manipulation
- **🎯 Control Flow**: Loops, conditionals, and procedures
- **🔄 System Calls**: Using Irvine32 library functions
- **✖️ Error Handling**: Input validation and exception management

---

## 📈 **Performance Metrics**

```mermaid
pie title Execution Time Distribution
    "Menu Navigation" : 15
    "Logic Processing" : 25
    "Series Generation" : 20
    "Truth Table" : 30
    "Encryption" : 10
```

---

## 🔮 **Future Enhancements**

- [ ] 🎨 GUI Implementation
- [ ] 📱 Cross-platform compatibility
- [ ] 🔢 Extended mathematical operations
- [ ] 📊 Advanced visualization
- [ ] 🌐 Web-based interface
- [ ] 📱 Mobile version

---

## 🎉 **Acknowledgments**

- **Kip Irvine** for the Irvine32 library
- **Microsoft** for MASM assembler
- **Assembly Language Community** for resources and support

---

<div align="center">  
  
  Found this project interesting? ⭐ **Star the repository!**
  
  Have suggestions? 💭 **Reach out!**
  ![Visitors](https://visitor-badge.laobi.icu/badge?page_id=MudasirNaeem1.Discrete-Mathematics-Calculator)
</div>

