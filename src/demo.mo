actor Demo {

    // This is how to define an immutable variable in Motoko (let)
    let website : Text = "https://motokobootcamp.com";

    // This is how to define a mutable variable in Motoko (var)
    var message : Text = "Welcome to Motoko Bootcamp - the best way to embark in the Web3 revolution";

    // This is how to define a query function in Motoko
    // Query calls complete quickly (≈200 ms) because they do not go through consensus and any change is not persisted
    public query func seeMessage() : async Text {
        return message;
    };

    // This is how to define an update function in Motoko
    // Updates calls takes longer to complete (≈2s) because they do need to go through consensus
    public func changeMessage(newMessage : Text) : async () {
        message := newMessage;
        return;
    };

    // This is not possible to change the value of an immutable variable
    // public func changeWebsite(newWebsite : Text) : async () {
    //     website := newWebsite;
    // };

}