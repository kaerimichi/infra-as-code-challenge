# Fun with Infra as Code - Challenge

<!-- vim-markdown-toc GFM -->

  * [What is that?](#what-is-that)
* [Introduction](#introduction)
  * [Starting point](#starting-point)
  * [After you finish](#after-you-finish)
  * [References](#references)

<!-- vim-markdown-toc -->

## What is that?

This project is a challenge made by [devgrid](http://devgrid.co.uk).

# Introduction

The goals of the challenge are:

* Choose on Cloud provider from the list below and ask us the credentials via the email we sent
   * Digital Ocean
   * AWS
   * GCP
* Provision an instance from scratch using Terraform on a cloud provider of your choice
* Install and configure a CI/CD tool of your choice in this new VM using Ansible;
* Configure a push deploy pipeline with the CI/CD tool with these repositories:
  * https://github.com/devgrid/calculator-service
  * https://github.com/devgrid/calculator-service-test

* **The main idea is that you do it yourself, if you don't, we will know.**

## Starting point

There are good examples of creating different resources using terraform and ansible.

* https://github.com/terraform-providers
* https://github.com/ansible/ansible-examples


## After you finish

* When it's finished, reply our email with the credentials to your setup.
* Create a pull request to this repository with your modifications.

## References

* https://www.terraform.io/docs/index.html
* https://docs.ansible.com/
