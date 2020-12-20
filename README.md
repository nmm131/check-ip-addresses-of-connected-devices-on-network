# Check IP Addresses of Connected Devices in a Network

Check IP Addresses of Connected Devices in a Network is a shell script designed to check the IP addresses of devices connected in a network. Two IP addresses are required as arguments to define the network range to ping. The first argument is the starting IP address in the range and the second is the last IP address in the range. It outputs the selected IP range to ping and all IP addresses that responded in the network.

## Installation

Download or Clone the repository to your local system using GitHub.com, GitHub Desktop application, Bitbucket.com, GitHub SourceTree application, or .zip

## Usage

Made with Linux and Shell Command Language.

Check IP Addresses of Connected Devices in a Network is re-runnable. Run the Shell Script called run.sh with two IP addresses as arguments as administrator. It is located within the project's folder. The program requires ping to be installed.

Some connected devices in the network may not respond within 1 second, but may still be active devices. To change the deadline you can change the -w timeout value of the ping command. To change the number of packets sent, you can change the -c count value.

**NOTE: You must run the Shell Script called run.sh as administrator.**

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)