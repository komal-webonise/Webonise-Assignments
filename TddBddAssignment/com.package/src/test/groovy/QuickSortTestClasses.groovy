import spock.lang.Specification

/**
 * Created by webonise on 22/8/16.
 */
class QuickSortTestClasses extends Specification {

    def "swapping is returning correct results"() {
        given:
        int[] array=[34, 56, 62, 11]
        int[] expectedResult=[34, 11, 62, 56]
        int i=1
        int j=3

        when:
        QuickSort.swap(array, i, j)

        then:
        array == expectedResult

    }

    def "find the pivot position"(){
        given:
        int[] array=[34, 56, 62, 11]

        int left=0
        int right=3
        int result_pivot=0
        int pivot=56

        when:
        result_pivot=QuickSort.findPivot(array, left,right)

        then:
        result_pivot == pivot
    }

    def "find the element where partition of array takes place"()
    {
        given:
        int[] array=[34, 56, 62, 11]

        int left=0
        int right=3
        int result_partition=0
        int partition=2

        when:
        result_partition=QuickSort.partition(array, left,right)

        then:
        result_partition == partition
    }

    def "get the sorted array using quicksort"(){
        given:
        int[] array=[34, 56, 62, 11]
        int[] expectedResult=[11,34,56,62]
        int i=0
        int j=3

        when:
        QuickSort.quickSort(array, i, j)

        then:
        array == expectedResult
    }
}
