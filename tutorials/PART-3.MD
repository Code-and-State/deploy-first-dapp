## Part 3: Test your app and join us at Motoko Bootcamp for a full week of learning!
> In this last part, we'll verify that your app works as expected. To do that, we'll use a canister that has already been deployed to the Internet Computer. This canister will interact with your own and verify that the functions you've written work as expected. Let's go! 

### What are inter-canister calls?
One of the most exciting aspects of the Internet Computer is the ability for canisters to easily communicate with each other. To achieve the vision of the Internet Computer, services (i.e. canisters) need to be able to call each other and interoperate with each other. This enables us to reuse the services that we've built and to build more complex services by combining existing ones or leveraging canisters from other developers. 

<p align="center"> <img src="./assets/actor_model.gif" width="800px" style="border: 2px solid black;"></p>
<p align="center">A canister receives a message, executes it, and possibly can send messages to other canisters or even create new canisters on the fly. </p>

In this last part, we'll learn how to perform our first inter-canister call, as you will call the **Test** canister that's created and deployed to the Internet Computer. 
 
### The Test canister
The **Test** canister is a live application that is deployed on the Internet Computer. You can access the Candid UI for this canister here: https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=anj57-7aaaa-aaaaj-qa23a-cai


The function that we are interested in calling is the `testApp` function. This function takes 2 arguments which are:
- `name`: the name of the owner of the canister (i.e. you).
- `message`: the message that you want to let on the wall, assuming the tests are successful.

### How to perform an inter-canister call?
To perform an inter-canister we will need to reference the actor we want to call within our code. We need two pieces of information about the canister we want to call:

1. The canister id - which in this case is **anj57-7aaaa-aaaaj-qa23a-cai**.
2. The interface of the canister, at least partially. To check the interface of any canister we can use the [Internet Computer Dasboard](https://dashboard.internetcomputer.org/canister/anj57-7aaaa-aaaaj-qa23a-cai)


In our case, we are only interested in the `testApp` function. The signature of this function is the following:
``` 
testApp : (name : Text, message : Text) -> async Text;
```

We can write our actor declaration as follows:
``` 
let testActor : actor {
    testApp : shared (name : Text, message : Text) -> async Text;
} = actor ("anj57-7aaaa-aaaaj-qa23a-cai");
```

Once we have declared our actor, we can call the `testApp` function as follows:
```
let result = await testActor.testApp("Your Name", "Your message");
```
### Task 8: Add the test function
Create a `test` function that takes two arguments `name` and `message` and calls the `testApp` function of the `testActor` actor.
```
test : shared (name : Text, message : Text) -> async Text;
```
### Task 9: Perfom the test
It's time to pass your canister to the test. Call the `test` function with your name and a message of your choice. 

You can call the test function in two different ways:
- Using the Candid UI as we've seen in Parts 1 & 2.
- Using the `dfx` command line tool. To do that, run the following command:
```
dfx canister call first_dapp --network ic test '("Your Name", "Your message")'
```

If everything works as expected, you should see your name and message on the wall of fame as well as unlocking access to the Motoko Bootcamp group.

**Congratulations! You have completed this tutorial**. 