#  Code analyser in Swift


CALL -- have solution

### NProtM -- Number of Protected Members
The number of protected methods and attributes of a class
**returns an integer**

### NOPA -- Number of Public Attributes
The number of public attributes of a class
**returns an integer**

### NOAV -- Number of Accessed Variables
The total number of variables accessed directly from the measured operation. Variables include parameters, local variables, but also instance variables and global variables 
**returns an integer**

### NOM -- Number of Methods
Number of methods of a class
**returns an integer**

### CYCLO -- McCabe’s Cyclomatic Number
The number of linearly-independent paths through an operation
 the cyclomatic complexity is the number of edges minus the number of nodes plus 2
**returns an integer**


### NOC -- Number of classes
numer of classes -_-
**returns an integer**

### FOUT
Henry and Kafura (1981) identified a form of the fan in - fan out complexity which maintains a count of the number of data flows from a component plus the number of global data structures that the program updates. The data flow count includes updated procedure parameters and procedures called from within a module.
Complexity = Length x (Fan-in x Fan-out)2
Length is any measure of length such as lines of code or alternatively McCabe's cyclomatic complexity is
sometimes substituted.
Henry and Kafura validated their metric using the UNIX system and suggested that the measured complexity of a component allowed potentially faulty system components to be identified. They found that high values of this metric were often measured in components where there had historically been a high number of problems.


### CALLS -- Number of called functions
How many different functions does this function call? Calling the same subfunction counts only once.
