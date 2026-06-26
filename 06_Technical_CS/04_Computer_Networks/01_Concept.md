# Computer Networks (CN) - Concept Guide

This guide covers the OSI model, TCP/IP layers, port mappings, and IP subnetting mathematics tested in the TCS NQT Prime Computer Networks section. It is designed to be fully self-contained.

---

## 1. The OSI 7-Layer Reference Model

The Open Systems Interconnection (OSI) model standardizes network communication functions into seven distinct logical layers.

| Layer # | Layer Name | Key Functionality | PDU Name | Hardware / Software | Key Protocols |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **7** | **Application** | Direct interface for user applications to access network services. | Data | Software (Browser, client) | HTTP, HTTPS, FTP, SMTP, DNS, DHCP |
| **6** | **Presentation**| Translates, encrypts, and compresses data (formatting syntax). | Data | Software | SSL, TLS, JPEG, ASCII, EBCDIC |
| **5** | **Session** | Establishes, maintains, and terminates communication sessions. | Data | Software (OS sockets) | NetBIOS, RPC, PPTP |
| **4** | **Transport** | End-to-end delivery, flow control, segment reassembly, error checking. | Segment (TCP) / Datagram (UDP) | Operating System / Gateway | TCP, UDP |
| **3** | **Network** | Logical routing, path determination, and logical addressing (IP). | Packet | Router, L3 Switch | IPv4, IPv6, ICMP, ARP, OSPF, BGP |
| **2** | **Data Link** | Physical addressing (MAC), framing, node-to-node link control. | Frame | Switch, Bridge, NIC | Ethernet, Wi-Fi (802.11), PPP, VLAN |
| **1** | **Physical** | Physical transmission of raw bits over physical mediums. | Bit | Hub, Repeater, Cables, Fiber | RJ45, DSL, Coaxial, Fiber Optics |

---

## 2. TCP/IP Model Mapping vs. OSI Model

The TCP/IP model is a simplified practical framework that consolidated the OSI session and presentation layers into the Application layer, and physical/data link layers into the Link layer.

```text
    OSI MODEL                            TCP/IP MODEL
┌──────────────────┐
│ 7. Application   │
├──────────────────┼─────────────────►  1. Application Layer
│ 6. Presentation  │
├──────────────────┤
│ 5. Session       │
├──────────────────┼─────────────────►  2. Transport Layer
│ 4. Transport     │
├──────────────────┼─────────────────►  3. Internet Layer
│ 3. Network       │
├──────────────────┼─────────────────►  4. Network Access (Link) Layer
│ 2. Data Link     │
├──────────────────┤
│ 1. Physical      │
└──────────────────┘
```

---

## 3. Protocols & Port Mappings Table

Port numbers identify specific processes or network services on a host.

| Protocol | Port Number | Transport Protocol | Primary Description |
| :--- | :--- | :--- | :--- |
| **FTP (Data)** | 20 | TCP | Transfers file data payload. |
| **FTP (Control)**| 21 | TCP | Transfers connection control commands. |
| **SSH** | 22 | TCP | Secure Shell encrypted remote host connection. |
| **Telnet** | 23 | TCP | Unencrypted remote terminal connection (insecure). |
| **SMTP** | 25 | TCP | Simple Mail Transfer Protocol (sending email). |
| **DNS** | 53 | UDP (queries) / TCP (zone) | Domain Name System (IP-to-Name translation). |
| **DHCP (Server)**| 67 | UDP | Server port for dynamic configuration lease. |
| **DHCP (Client)**| 68 | UDP | Client port for obtaining dynamic configurations. |
| **TFTP** | 69 | UDP | Trivial File Transfer Protocol (low overhead). |
| **HTTP** | 80 | TCP | Hypertext Transfer Protocol (unencrypted web). |
| **POP3** | 110 | TCP | Post Office Protocol v3 (retrieve email, no sync). |
| **IMAP** | 143 | TCP | Internet Message Access Protocol (retrieve & sync). |
| **SNMP** | 161 / 162 | UDP | Simple Network Management Protocol (monitoring). |
| **HTTPS** | 443 | TCP | Hypertext Transfer Protocol Secure (SSL/TLS). |

---

## 4. Classless IP Subnetting Mathematics

Subnetting divides a larger classful network block into smaller, manageable, and isolated sub-networks.

### Subnetting Formulas & Derivations
*   **Total Subnets Created:**
    $$\text{Number of Subnets} = 2^s$$
    *   *Where:* $s$ is the number of bits borrowed from the default host portion of the IP class.
*   **Total Hosts per Subnet:**
    $$\text{Total Addresses} = 2^h$$
    *   *Where:* $h$ is the number of remaining host bits ($h = 32 - \text{CIDR mask}$).
*   **Usable Hosts per Subnet:**
    $$\text{Usable Hosts} = 2^h - 2$$
*   **Derivation of the $-2$ Rule:**
    *   The **Network Address** (all host bits set to `0`) represents the subnet identity itself and cannot be assigned to a host.
    *   The **Directed Broadcast Address** (all host bits set to `1`) is used to transmit a packet to every host on that specific subnet.
    *   Because these two boundary addresses serve control purposes, we must subtract 2 from the total capacity to get the usable host count.

---

### Class C /26 Subnetting Worked Example

Let us divide the Class C block **`192.168.1.0/24`** using a **/26 CIDR mask**.

#### Step 1: Calculate Bits & Capacity
*   **Default Mask (Class C):** `/24` (24 network bits, 8 host bits).
*   **New Subnet Mask:** `/26` (binary: `11111111.11111111.11111111.11000000` $\rightarrow$ `255.255.255.192`).
*   **Borrowed Bits ($s$):** $26 - 24 = 2$ bits.
*   **Remaining Host Bits ($h$):** $32 - 26 = 6$ bits.
*   **Number of Subnets:** $2^s = 2^2 = 4$ subnets.
*   **Usable Hosts per Subnet:** $2^h - 2 = 2^6 - 2 = 64 - 2 = 62$ hosts.

#### Step 2: Formulate Subnet Boundaries

| Subnet # | Network ID | First Usable IP | Last Usable IP | Broadcast IP |
| :--- | :--- | :--- | :--- | :--- |
| **Subnet 0** | `192.168.1.0` | `192.168.1.1` | `192.168.1.62` | `192.168.1.63` |
| **Subnet 1** | `192.168.1.64` | `192.168.1.65` | `192.168.1.126` | `192.168.1.127` |
| **Subnet 2** | `192.168.1.128` | `192.168.1.129` | `192.168.1.190` | `192.168.1.191` |
| **Subnet 3** | `192.168.1.192` | `192.168.1.193` | `192.168.1.254` | `192.168.1.255` |

---

## 5. Top 15 TCS NQT CN MCQ One-Liners

**Q1.** Which layer of the OSI model is responsible for encryption and data formatting?
*   **A:** Presentation Layer (Layer 6).

**Q2.** What is the default port number and transport protocol for secure web traffic?
*   **A:** Port 443 over TCP (HTTPS).

**Q3.** Which protocol resolves a known IP address to its corresponding physical MAC address?
*   **A:** ARP (Address Resolution Protocol).

**Q4.** What is the primary difference between Hubs and Switches?
*   **A:** Hubs operate at Layer 1 and broadcast all packets to all ports (one collision domain); Switches operate at Layer 2 and forward packets selectively based on MAC tables (each port is a collision domain).

**Q5.** What PDU is associated with the Transport layer?
*   **A:** Segment (TCP) or Datagram (UDP).

**Q6.** Which routing protocol uses the Dijkstra algorithm to calculate shortest paths?
*   **A:** OSPF (Open Shortest Path First).

**Q7.** What class of IPv4 addresses is reserved for multicast communication?
*   **A:** Class D (range `224.0.0.0` to `239.255.255.255`).

**Q8.** What protocol is used to query database mappings of hostname-to-IP relationships?
*   **A:** DNS (Domain Name System).

**Q9.** Which protocol manages dynamic IP address assignment automatically?
*   **A:** DHCP (Dynamic Host Configuration Protocol).

**Q10.** What mechanism is used in TCP to prevent a sender from overwhelming a receiver with data?
*   **A:** Flow Control (implemented via the Sliding Window protocol).

**Q11.** What is the size of an IPv6 address?
*   **A:** 128 bits (16 bytes), written in hexadecimal.

**Q12.** What parameter in an IP header prevents packets from circulating indefinitely in loops?
*   **A:** TTL (Time to Live) field (decremented by 1 at each router hop).

**Q13.** Which protocol is used by the ping utility to check network connectivity?
*   **A:** ICMP (Internet Control Message Protocol).

**Q14.** What is the loopback IP address in IPv4?
*   **A:** `127.0.0.1` (used to test local TCP/IP stacks).

**Q15.** What is the CIDR representation of the subnet mask `255.255.255.240`?
*   **A:** `/28` (since it contains 28 network prefix bits).

---

## 6. Dissecting TCS NQT CN Trap Questions

### Question 1: ARP Broadcasting Scope
When an ARP Request is transmitted, how does the packet propagate through local subnet boundaries?
*   A) It is unicast directly to the target destination.
*   B) It is broadcast across the entire Internet.
*   C) It is broadcast locally at Layer 2 but blocked by Layer 3 routers.
*   D) It is forwarded by routers using RIP routing tables.
*   **Correct Answer:** **C**
*   **Trap Explanation:** A common trap is assuming ARP requests propagate through the web to resolve target hostnames. ARP requests utilize MAC broadcast address `FF:FF:FF:FF:FF:FF` which propagates to all local hosts on the switch, but routers do not forward broadcasts across different subnets.

### Question 2: TCP Handshake Sequence
What is the exact exchange sequence of flag payloads during a standard TCP 3-way connection handshake?
*   A) `SYN` $\rightarrow$ `ACK` $\rightarrow$ `SYN-ACK`
*   B) `SYN` $\rightarrow$ `SYN-ACK` $\rightarrow$ `ACK`
*   C) `SYN` $\rightarrow$ `SYN` $\rightarrow$ `ACK`
*   D) `ESTABLISH` $\rightarrow$ `SYN` $\rightarrow$ `ACK`
*   **Correct Answer:** **B**
*   **Trap Explanation:** Option A is a common trap representing a misordered sequence. The correct sequence is: Client sends `SYN`, Server responds with `SYN-ACK` (synchronize and acknowledge), Client replies with `ACK`.

### Question 3: Host Capacity Calculation
A company is assigned the subnet block `172.16.5.0/30`. How many physical host devices can be assigned active IP addresses in this subnet?
*   A) 4
*   B) 2
*   C) 0
*   D) 30
*   **Correct Answer:** **B**
*   **Trap Explanation:** A common mistake is thinking a `/30` mask gives $2^{(32-30)} = 4$ usable host IPs. While there are 4 total addresses, we must subtract 2 for the Network ID (`172.16.5.0`) and the Broadcast ID (`172.16.5.3`), leaving only 2 usable host IPs (`172.16.5.1` and `172.16.5.2`).

### Question 4: DNS Transport Protocols
Which transport protocol is used by DNS queries, and why?
*   A) TCP exclusively, because resolving IP addresses demands reliable delivery.
*   B) UDP exclusively, to minimize transmission latency.
*   C) Both TCP and UDP, using UDP for standard queries and TCP for zone transfers.
*   D) HTTP, since DNS operates at the Application layer.
*   **Correct Answer:** **C**
*   **Trap Explanation:** Students often select Option B thinking DNS is strictly UDP. While client queries are indeed sent via UDP Port 53 to save connection overhead, DNS uses TCP Port 53 for server-to-server zone transfers (which require data reliability) and when query sizes exceed 512 bytes.

### Question 5: Bridge Forwarding Decisions
A learning transparent bridge receives a frame with a destination MAC address that is not present in its forwarding database table. What action does the bridge take?
*   A) Discards the frame immediately.
*   B) Sends an ICMP Destination Unreachable packet.
*   C) Floods the frame out of all ports except the receiving port.
*   D) Query the default gateway router.
*   **Correct Answer:** **C**
*   **Trap Explanation:** A common trap is selecting A or B, thinking bridges drop frames for unknown destinations. Instead, bridges perform **flooding** (broadcast-like behavior) for unknown unicasts to ensure the frame reaches the destination host, which will respond and allow the bridge to learn its port mapping.
