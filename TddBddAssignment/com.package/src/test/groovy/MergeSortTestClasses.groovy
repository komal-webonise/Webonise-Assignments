import spock.lang.Specification

/**
 * Created by webonise on 22/8/16.
 */
class MergeSortTestClasses extends Specification{
    def "get the sorted array using mergesort"(){
        given:
        int[] array=[34, 56, 62, 11]
        int[] expectedResult=[11,34,56,62]
        int i=0
        int j=3

        when:
       MergeSort.mergeSort(array, i, j)

        then:
        array == expectedResult
    }
 def "merge the two arrays using mergesort"()
 {
     given:
     int[] array=[34, 56, 62, 11,97,15]
     int[] expectedResult=[11, 34, 56, 62, 97, 15]
     int i=0
     int m=2
     int j=5

     when:
     MergeSort.merge(array, i,m, j)

     then:
     array == expectedResult

 }
}
