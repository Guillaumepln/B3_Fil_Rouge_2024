```mermaid
graph TD
    A[Start] --> B{Condition?}
    B -->|Yes| C[Do something]
    B -->|No| D[Do something else]
    C --> E[End]
    D --> E
