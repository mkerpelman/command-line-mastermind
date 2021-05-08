# module Playable

    def compare_guess_to_master(guess_array, master_array)
        guess_array_copy = guess_array.clone
        master_array_copy = master_array.clone
        exact_matches = calculate_exact_matches(guess_array_copy, master_array_copy)
        approximate_matches = calculate_approximate_matches(guess_array_copy, master_array_copy)
        { :exact => exact_matches, :approximate => approximate_matches }
    end

    # private

    def calculate_exact_matches(guess_array, master_array)
        exact_matches = 0
        guess_array.each_with_index do |number, index|
            if number == master_array[index]
                exact_matches += 1
                guess_array[index] = 'skip'
                master_array[index] = 'skip'
            end
        end
        exact_matches
    end

    def calculate_approximate_matches(modified_guess_array, modified_master_array)
        (modified_guess_array.filter { |n| n != 'skip'} & modified_master_array.filter { |n| n != 'skip' }).length
    end

# end