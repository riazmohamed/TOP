# bubble_sort.rb

def bubble_sort(unsorted_array)
  counter = 0
  first = unsorted_array.min
  last = unsorted_array.max
  until unsorted_array[0] == first && unsorted_array[-1] == last
    current = unsorted_array[counter]
    next_ele = unsorted_array[counter + 1]
    if current > next_ele
      unsorted_array[counter + 1] = current
      unsorted_array[counter] = next_ele
    end
    counter += 1
    counter = 0 if counter >= unsorted_array.length - 1
  end
  unsorted_array
end

p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]
