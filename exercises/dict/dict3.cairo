// dict3.cairo
// Custom data structure using dicts
// Using Felt252Dict in structures allow us to modify values stored in memory
// In this exercise we have a struct Team where a Felt252Dict maps the name of the player to its level and keeps track of
// the number of player.
// Using the methods set and get from the Felt252DictTrait, implement to functions to modify the level of your team.
// Make me compile and pass the test!
// Execute `starklings hint dict3` or use the `hint` watch subcommand for a hint.


// I AM NOT DONE


#[derive(Destruct)]
struct Team {
  level: Felt252Dict<usize>,
  number_of_player: usize 
}

#[generate_trait]
impl TeamImpl of TeamTrait {
    fn new() -> Team {
        //TODO : initialize empty team with 0 player
    }

    fn get_level(ref self: Team, name: felt252) -> usize {
        //TODO 
    }

    fn add_player(ref self: Team, name: felt252, level: usize) -> () {
        //TODO
    }

    fn level_up(ref self: Team, name: felt252) {
        //TODO
    }

    fn number_of_player(self: @Team) -> usize {
        //TODO
    }
}



#[test]
fn test_add_player() {

    let mut team = TeamTrait::new();
    team.add_player('bob', 10);
    team.add_player('alice', 20);

    assert(team.number_of_player == 2, 'Wrong number of player');
    assert(team.get_level('bob') == 10, 'Wrong level');
    assert(team.get_level('alice') == 20, 'Wrong level');
}

#[test]
fn test_level_up() {

    let mut team = TeamTrait::new();
    team.add_player('bobby',10);
    team.level_up('bobby');

    assert(team.level.get('bobby') == 11, 'Wrong level');
}
