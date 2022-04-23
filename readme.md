# Master Thesis: Kubernetes Forensics

This repository serves as a static repo that hosts my master thesis on [Kubernetes Forensics](Kubernetes-Forensics.pdf). It furthermore includes the examples and several other files that are needed in order to follow along the tests or work on enhancements. :) 

In order to view the files specific to an analyzed scenario, decompress them using `tar -xzvf` or whatever fits your needs. :)

Note: When extracted, the size of this repo will be around 3.9GB. 

The files `_checksums.*` contain checksums of all files, including extracted ones.

## Abstract

The introduction of containerized applications leads to a shift in classic software architecture.
Where, previously, single physical or virtual host systems have been used that contained all necessary components to run an application installed on the operating system, a more isolated approach is taken nowadays in which the single components are run in dedicated containers.
With the growing usage of containers, the interests for a container orchestration software that can handle the management of distributed container environments is also rising.
One of such tools is _Kubernetes_.
But how does the usage of such tools affect the process of a forensic investigation? 
Are specific traces left by such tools that are not necessarily related to the application running in containers, or the operating system itself? 
This thesis covers the identification, definition and evaluation of forensic artifacts on _Kubernetes_ and tries to document those.
To do so, the states of a _Kubernetes_ cluster before and after a performed action were compared to each other.
A major objective regarding the analysis process was the automation.
Traces that occur in every single run of an analysis were declared as characteristic, evaluated and probably documented as a forensic artifact to this action.

In the course of the work, the applied analysis method turned out to be applicable and generated evidences of single actions.
As a result, artifacts from both _Kubernetes_ and the used container runtime _containerd_ were detected, described and documented in a human- and machine-readable format so that they can get contributed to the open source community.
Furthermore, a preparation for forensic teams could be worked out on how to prepare specifically for incident response cases that involve a _Kubernetes_ cluster and which artifacts should get saved first, based on their relevance.

## Work on enhancements

If you are interested in working on enhancements, please take a look at the framework which has been developed in the course of my thesis: [PowerForensicator](https://github.com/pr3l14t0r/PowerForensicator).

Also you might want to take a look on my PowerShell wrapper for VirtualBox commands: [Vbox4Pwsh](https://github.com/pr3l14t0r/Vbox4Pwsh).

One of the main result of this work has been the identification of forensic artifacts specific to Kubernetes. They were discussed and applied to the project/repository [ForensicArtifacts](https://github.com/ForensicArtifacts/artifacts/) in a [PR](https://github.com/ForensicArtifacts/artifacts/pull/444). 

Enhancements are always welcome!
