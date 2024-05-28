/// Module: sui_coin
module sui_coin::sui_coin {

    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::TxContext;
    use std::string::String;
    use std::vector;
    use sui::event;
    use std::string;
    use sui::url;

    struct SUICOIN has key {
        id: UID,
        generation: u64,
        birthdate: u64,
        attributes: vector<String>,
    }

    struct SUICOIN has drop {}
    
    public fun balance<T>(coin: &Coin<T>): &Balance<T> {
    &coin.balance
    }

    fun init(otw: SUICOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            9,
            b"SUQWE",
            b"SUQWE",
            b"SUQWE",                       option::some(url::new_unsafe(string::utf8(bb""))),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }
}

    entry fun mint(treasury_cap: &mut TreasuryCap<SUICOIN>, ctx: &mut TxContext) {
    let coins = coin::mint(treasury_cap, 1000, ctx);
    // Do something with the coins
}
`6;`6;
