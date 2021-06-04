<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Jalmeida1994/GatherChain-Testing">
    <img src="images/Logo-02.png" alt="Logo" width="120">
  </a>

  <h3 align="center">GatherChain Tests</h3>

  <p align="center">
    Testing scripts for the GatherChain solution.
    <br />
    <a href="https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/README.md"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Jalmeida1994/GatherChain-Testing/issues">Report Bug</a>
    ·
    <a href="https://github.com/Jalmeida1994/GatherChain-Testing/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

GatherChain is the solution created for my Master Thesis: __Tracing Responsibility in Evolution of Model's Life Cycle in Collaborative Projects in Education__.
In the paper, it is proposed a blockchain-based solution for version control of model-driven engineering artefacts.  The goal is to facilitate collaboration in a multi-user area,like the education field, and track changes in a trusted and secure manner. This solution is based on using the Hyperledger Fabric Network to govern and regulate file version control functions among students and teachers.

The GatherChain project repositories are:
* __GatherChain ARM Template__: https://github.com/Jalmeida1994/GatherChain-ARM-Template
* __GatherChain Desktop Client__: https://github.com/Jalmeida1994/GatherChain-DesktopClient
* __GatherChain Web Server__: https://github.com/Jalmeida1994/GatherChain-Web-Server
* __GatherChain Blockchain Server__: https://github.com/Jalmeida1994/GatherChain-BlockChain-Server
* __GatherChain Admin Commands__: https://github.com/Jalmeida1994/GatherChain-AdminCommands

This repository just hosts the stress and usability tests of the GatherChain solution.

### Built With

* [Shell Scripts](https://www.shellscript.sh)
    * [GNU Bash](https://www.gnu.org/software/bash/)


<!-- GETTING STARTED -->
## Getting Started

In this section it'll be shown how to get started with the Stress Tests.
### Prerequisites

* [GatherChain ARM Template deployed](https://github.com/Jalmeida1994/GatherChain-ARM-Template)

### Installation

1. Clone the repo
   ```
   git clone https://github.com/Jalmeida1994/GatherChain-Testing.git
   ```
2. Change the [`weburl.env`](https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/.weburl.env) file with the URL of the WebApp instantiated during the GatherChain ARM Template phase.
    ```
    export WEB_URL=https://NameOfTheApp.azurewebsites.net
    ```
    The domain `azurewebsites` is only used if the GatherChain Template was deployed in Azure and if no custom domain was configured in the webapp.

3. Initialize the blockchain network if not already running with [`init.sh`](https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/commands/init.sh)
   ```
   ./commands/init.sh
   ```
   

<!-- USAGE EXAMPLES -->
## Usage
### Testing
In testing is leveraged the `time` function. To know more check the following [link](https://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1/556411#556411).

1. To test the [`test1.sh`](https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/commands/.test1.sh) that consists in 3 users registrations, 1 group creation and some commit pushes, in a sequencial order
   ```
   time ./commands/test1.sh
   ```
5. To test the [`test2.sh`](https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/commands/.test2.sh) that consists in 6 users registrations, 2 group creation and more commit pushes, in a sequencial order
   ```
   time ./commands/test2.sh
   ```
6. To test the [`test3.sh`](https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/commands/.test3.sh) that consists in 6 users registrations, 2 group creation and even more commit pushes, in a parallel order
   ```
   time ./commands/test3.sh
   ```

7. To test the [`test4.sh`](https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/commands/.test4.sh) that consists in 3 users registrations, 1 group creation and a variable number of commit pushes (randomly distributed by the 3 users) received as an argument by the function, in a sequencial order
   ```
   time ./commands/test4.sh ${numberOfCommits}
   ```

<!-- USAGE EXAMPLES -->
### Cleanup

To clear all solution (blockchain network and cache) use [`clear.sh`](https://github.com/Jalmeida1994/GatherChain-Testing/blob/master/commands/clear.sh)
   ```
   ./commands/clear.sh
   ```

<!-- CONTACT -->
## Contact

João Almeida - [@João Almeida](https://www.linkedin.com/in/jo%C3%A3o-almeida-525476125/) - jcfd.almeida@campus.fct.unl.pt

Project Link: [https://github.com/Jalmeida1994/GatherChain-Testing](https://github.com/Jalmeida1994/GatherChain-Testing)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [FCT-UNL](https://www.fct.unl.pt/)
* [Professor Vasco Amaral](https://docentes.fct.unl.pt/vma/)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Jalmeida1994/GatherChain-Testing.svg?style=for-the-badge
[contributors-url]: https://github.com/Jalmeida1994/GatherChain-Testing/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Jalmeida1994/GatherChain-Testing.svg?style=for-the-badge
[forks-url]: https://github.com/Jalmeida1994/GatherChain-Testing/network/members
[stars-shield]: https://img.shields.io/github/stars/Jalmeida1994/GatherChain-Testing.svg?style=for-the-badge
[stars-url]: https://github.com/Jalmeida1994/GatherChain-Testing/stargazers
[issues-shield]: https://img.shields.io/github/issues/Jalmeida1994/GatherChain-Testing.svg?style=for-the-badge
[issues-url]: https://github.com/Jalmeida1994/GatherChain-Testing/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/jo%C3%A3o-almeida-525476125/
[product-screenshot]: images/arm-template.png
