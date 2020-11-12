# bubble_sort.rb

def bubble_sort(unsorted_array)
  counter = 0
  times_sorted = 0
  sort_times = unsorted_array.length - 1

  loop do
    current = unsorted_array[counter]
    next_ele = unsorted_array[counter + 1]
    if current > next_ele
      unsorted_array[counter + 1] = current
      unsorted_array[counter] = next_ele
    end
    counter += 1
    if counter >= unsorted_array.length - 1
      counter = 0
      times_sorted += 1
    end
    break if times_sorted == sort_times
  end
  unsorted_array
end

p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]
