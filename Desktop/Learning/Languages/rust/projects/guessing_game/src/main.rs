use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    loop {
        println!("Enter Number: ");

        let mut guess = String::new();

        io::stdin().read_line(&mut guess).expect("Error input");

        println!("Your number : {guess}");

        let secret_number = rand::thread_rng().gen_range(1..=100);

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("ENTER AN INTEGER!!");
                continue;
            }
        };

        println!("the secret number is {secret_number}");

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Your number is Smaller\n"),
            Ordering::Greater => println!("Your number is Greater\n"),
            Ordering::Equal => {
                println!("Correct, nice guess\n");
                break;
            }
        }
    }
}
