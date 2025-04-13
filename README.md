# TAMUSA_CSCI4349_Week9_Honeypot

## Project Overview

This repository is part of the CSCI4349 Week 9 penetration testing course at Texas A&M University-San Antonio. It provides a comprehensive manual setup guide for deploying a honeypot using Vagrant and Google Cloud. The purpose of this project is to simulate and analyze network attacks in a controlled environment, allowing students to understand the dynamics of cybersecurity threats and defenses.

The project is structured as follows:
- **Documentation**: Contains the setup guide and any additional notes or resources needed.
- **Scripts**: Includes scripts to automate parts of the setup and configuration process.
- **Vagrantfile**: Configuration file for setting up the virtual environment using Vagrant.
- **Firewall Rules**: Configuration files for setting up and managing firewall rules on Google Cloud.

## Setup and Installation Instructions

### Prerequisites
- Vagrant: Ensure you have Vagrant installed on your machine. Download it from [Vagrant's official site](https://www.vagrantup.com/downloads).
- VirtualBox: Vagrant requires a virtualization tool, and VirtualBox is recommended. Download it from [VirtualBox's official site](https://www.virtualbox.org/wiki/Downloads).
- Google Cloud Account: Ensure you have access to a Google Cloud account. If you do not have one, you can sign up at [Google Cloud](https://cloud.google.com/).

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/TAMUSA_CSCI4349_Week9_Honeypot.git
   cd TAMUSA_CSCI4349_Week9_Honeypot
   ```

2. **Set up the Virtual Machine**
   ```bash
   vagrant up
   ```

3. **Access the Virtual Machine**
   ```bash
   vagrant ssh
   ```

4. **Configure Google Cloud Firewall Rules**
   - Navigate to the Google Cloud Console.
   - Go to the Firewall rules section under VPC network.
   - Create new rules as specified in the `firewall-rules.md` documentation.

5. **Deploy the Honeypot**
   - Follow the detailed instructions in the `honeypot-setup.md` to deploy your honeypot within the virtual machine.

## Usage Examples

Once your honeypot is set up, you can start simulating attacks:
- Try probing the honeypot from another machine to see how it logs the attempts.
- Analyze the incoming traffic using tools like Wireshark.

## Contribution Guidelines

Contributions are welcome, especially from students and faculty members. To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

For more information or support, contact the repository administrators or course instructors.