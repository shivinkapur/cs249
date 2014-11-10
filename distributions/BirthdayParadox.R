#  The Birthday Paradox:  in a room with 23 people,
#      the probability is about 0.5 that at least 2 will have the same birthday.

n = 23  #  some number of people

number_of_samples = 1000

number_of_samples_with_coincidences = 0

for (i in 1:number_of_samples) {
   birthdays = sample( 1:365, n, replace=TRUE )  # pick a sample of n birthdays (with replacement)
   number_of_samples_with_coincidences = number_of_samples_with_coincidences + any(duplicated(birthdays))
}

number_of_samples_with_coincidences / number_of_samples
