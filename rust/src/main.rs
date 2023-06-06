fn print_given_phrase(phrase: &str) {
    println!("Printing: {}",phrase);
}

fn main() {
    let args: Vec<String> = std::env::args().collect();

    if args.len() == 3 {
        let phrase = &args[1];
        let number_of_repeats_as_string = &args[2];
        let number_of_repeats: i32 = number_of_repeats_as_string.parse().unwrap();
        let mut current_repeat = 0;

        while current_repeat != number_of_repeats {
            print_given_phrase(phrase);
            current_repeat+=1;
        }
    } else {
        let executable_name = &args[0];
       println!("ERROR: Wrong arguments provided.\nYou should call {} [phrase_to_print] [number_of_repeats]", executable_name);
    }
}
