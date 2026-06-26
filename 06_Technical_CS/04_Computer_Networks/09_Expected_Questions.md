# Computer Networks - Expected Questions (TCS NQT)

This file contains expected questions on Computer Networks (CN) for the TCS NQT exam.

---

## 1. CN-01: OSI Model Layers & Protocols

*   **Question**: Outline the 7 layers of the OSI model and list their core protocols.
*   **Layers Summary Table**:
| Layer Name | Data Unit | Core Function | Protocols |
| :--- | :--- | :--- | :--- |
| **7. Application** | Data | End-user interface, APIs | HTTP, FTP, DNS, SMTP |
| **6. Presentation**| Data | Data formatting, encryption | SSL, TLS, ASCII, JPEG |
| **5. Session** | Data | Session establishment, sync | RPC, NetBIOS |
| **4. Transport** | Segment/Datagram | End-to-end reliability | TCP, UDP |
| **3. Network** | Packet | Routing, logical addressing | IP (IPv4/IPv6), ICMP, OSPF |
| **2. Data Link** | Frame | Physical addressing, hop-to-hop | Ethernet, PPP, MAC |
| **1. Physical** | Bits | Physical medium transmission | RS-232, fiber optics |

*   **Shortcut**: "All People Seem To Need Data Processing" (Application, Presentation, Session, Transport, Network, Data Link, Physical).

---

## 2. CN-02: IP Addressing & Subnetting Calculations

*   **Question**: Given a Class C IP address block `192.168.1.0/26`, find the subnet mask, number of usable subnets, and number of usable hosts per subnet.
*   **Derivation**:
    1.  The CIDR notation `/26` means the first 26 bits are set to 1 for the subnet mask:
        $$\underbrace{11111111}_{255} . \underbrace{11111111}_{255} . \underbrace{11111111}_{255} . \underbrace{11000000}_{192} \implies 255.255.255.192$$
    2.  Class C default mask is `/24`. We borrowed $26 - 24 = 2$ bits.
        *   Number of subnets $= 2^2 = 4$.
    3.  Remaining host bits $= 32 - 26 = 6$ bits.
        *   Total hosts per subnet $= 2^6 = 64$.
        *   Usable hosts per subnet $= 2^6 - 2 = 62$ (subtracting network address and broadcast address).
*   **Real Number Demo**: For subnet 0: Network address = `192.168.1.0`, Usable IP range = `192.168.1.1` to `192.168.1.62`, Broadcast address = `192.168.1.63`.

---

## 3. CN-03: TCP vs UDP & Sliding Window Flow Control

*   **Question**: Distinguish between TCP and UDP. Explain sliding window flow control.
*   **Comparison**:
| Feature | TCP | UDP |
| :--- | :--- | :--- |
| **Connection** | Connection-oriented (requires 3-way handshake). | Connectionless. |
| **Reliability** | Reliable (acknowledgments, retransmissions). | Unreliable (best-effort delivery). |
| **Header Size** | 20 bytes. | 8 bytes. |
| **Flow Control**| Yes (sliding window). | No. |

*   **Sliding Window Mechanism**: The sender can transmit multiple packets before receiving an acknowledgment. The window size represents the buffer limit. If a packet is lost, the sender halts window slide and retransmits (Go-Back-N or Selective Repeat).

---

## 4. CN-04: DNS and HTTP/HTTPS

*   **Question**: Describe the steps in a DNS lookup. What is the difference between HTTP and HTTPS?
*   **DNS Resolution Flow**:
    1.  User enters `google.com`. Browser checks local cache.
    2.  If not found, queries **Recursive Resolver** (ISP).
    3.  Recursive resolver queries **Root Name Server** (returns `.com` TLD address).
    4.  Resolver queries **TLD Name Server** (returns `google.com` Authoritative server address).
    5.  Resolver queries **Authoritative Name Server** (returns IP address).
    6.  Recursive resolver caches IP and returns it to browser.
*   **HTTP vs HTTPS**:
    *   HTTP transmits data in plain text over port 80.
    *   HTTPS encrypts data using SSL/TLS over port 443, ensuring confidentiality and integrity.
