# Part 1: Learn with the Demo dApp.

> In this first part, we will use a demo dApp so that you can get familiar with the Motoko syntax and how to deploy applications. The code of the demo dApp has already been written for you. The file [src/example.mo](./src/example.mo) contains the source code.

## What is a canister?

The concept of **canisters** is fundamental to understand how to build dApps on the **Internet Computer**. The **Internet Computer** is a platform that hosts a large number of applications, all of those applications run smoothly within special containers called **canisters**.

- The Internet Computer is responsible for smoothly and safely run all the canisters deployed on the platform in parallel.
- Developers build applications by writing the source code for those canisters. An application can be built into one or several canisters depending on the architecture.
- Users will interact with applications by sending messages to canisters. This happens whenever you use an application on the Internet Computer and interact with it - a few examples of such interactions are:
  - When you post on a social network.
  - When you send a token to another address.
  - When you buy or sell an NFT.
  - When you read content on a website hosted on the Internet Computer.
  - And way more...

<p align="center"> <img src="./assets/part-1/oc_message.png" height="600px" style="border: 1px solid black;"/> </p>
<p align="center"> OpenChat is a decentralized messaging application built on the Internet Computer. </p>

At its core, a canister consists of two key components: a WebAssembly module and memory:

- The WebAssembly module is a compiled piece of code written in languages like Rust or Motoko. This code is what gets installed in the canister and is responsible for executing the canister's functions.
- WebAssembly memory, often referred to as memory pages, serves as the storage for the canister's state and various files, including photos, videos, files and arbitrary data.

> So essentially a canister is **Code + State.** 😉

## The Motoko language
**Motoko** is a new language that was developed by the [DFINITY Foundation](https://dfinity.org/) to develop canisters. The **Motoko** language is a high-level language that is compiled to WebAssembly.

<p align="center"> <img src="./assets/part-1/motoko_banner.png" style="border: 1px solid black;"/> </p>

The **Motoko** file is the file that contains the code of your application. It has the extension `.mo`. 

<p align="center"> <img src="./assets/part-1/motoko_file.png" style="border: 1px solid black;"/> </p>


You will notice that this file usually starts with the `actor` keyword:
```
actor {
    // CODE
}
```

An actor is the representation of a canister in the **Motoko** language. This nomeclature comes from the [Actor model](https://en.wikipedia.org/wiki/Actor_model).

When we will deploy our canister, the Motoko compiler will create a WebAssembly module that will be deployed to the Internet Computer.

## Declaring a variable in Motoko
In Motoko, variables can be declared in two ways:

- Using the `let` keyword. This is how you define an **immutable** variable. This means once the value is set you won't be able to change it anymore.

```
let website : Text = "motokobootcamp.com";
```

- Using the `var` keyword. This is how you define a **mutable** variable. This means once the value is set you will be able to change it. To reassign a new value to a variable, you will need to use the `:=` operator.

```
var message : Text = "Welcome to Motoko Bootcamp - the best way to embark in the Web3 revolution";
message := "This is a new message";
```

> Whenever you declare a variable, don't forget to end the declaration by a `;`. This is how you tell the compiler that you are done with this statement.

## Declaring a function in Motoko

In Motoko, a function can be of two types:

- A **query** function. This is a function that is read-only. This means that it cannot change the state of the canister. A **query** call is extremly fast, as it doesn't need to go through the consensus mechanism of the Internet Computer. To declare a **query** function simply add the `query` keyword to your function declaration.
```
public query func seeMessage() : async Text {
    return message;
};
```
- An **update** function. This is a function that can change the state of the canister. An **update** function is slower than a **query** function as it needs to go through the consensus mechanism of the Internet Computer, which takes around 2 seconds. By default, any function is an **update** function.
```
public func changeMessage(newMessage : Text) : async () {
    message := newMessage;
    return;
};
```
## Deploying a canister
To deploy a canister, we will use the `dfx` command line tool. This tool is already installed in the Dev Container. To deploy the Demo canister, you need to run the following command:

```
$ dfx deploy --playground demo
```

This command will compile the Motoko file, create the WebAssembly module, create a canister and deploy the WebAssembly module inside. Usually to deploy on the Internet Computer, we should pay with a currrency called **cycles**. However, in this case, we will use the `--playground` flag which will allow us to deploy our canister for free. Note that any canister deployed with the `--playground` flag will be automatically deleted after 20 minutes.

Once your canister is deployed, note the canister ID. It should looks something like this:
```
Reserved canister 'demo' with id yjj7c-kaaaa-aaaab-qaceq-cai with the playground.
```
## Interacting with a canister
The **Candid** interface allows us to call our canister and interact with it. <br/>
The url to access the **Candid** interface for your canister is the following: `https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.icp0.io/?id=<YOUR_CANISTER_ID>`

<p align="center"> <img src="./assets/part-1/candid_ui.png" style="border: 1px solid black;"/> </p>
<p align="center"> The Candid UI can be used to call any public function of your canister</p>

> Test calling `changeMessage` and `setMessage` and notice the difference in speed.

