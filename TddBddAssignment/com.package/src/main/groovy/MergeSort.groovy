/**
 * Created by webonise on 22/8/16.
 */
/**
 * Created by webonise on 22/8/16.
 */
public class MergeSort {

    public static void merge(int[] array, int left, int m, int right) {

        int n1 = m - left + 1
        int n2 = right - m


        int[] left_array = new int[n1]
        int[] right_array = new int[n2]


        for (int i = 0; i < n1; ++i)
            left_array[i] = array[left + i]
        for (int j = 0; j < n2; ++j)
            right_array[j] = array[m + 1 + j]



        int i = 0, j = 0


        int k = left;
        while (i < n1 && j < n2) {
            if (left_array[i] <=right_array[j]) {
                array[k] =left_array[i]
                i++
            } else {
                array[k] = right_array[j]
                j++
            }
            k++
        }


        while (i < n1) {
            array[k] = left_array[i]
            i++
            k++
        }


        while (j < n2) {
            array[k] = right_array[j]
            j++
            k++
        }
    }


    public static void mergeSort(int[] array, int left, int right) {
        if (left < right) {

            int middle = (left + right) / 2;


            mergeSort(array, left, middle);
            mergeSort(array, middle + 1, right)


            merge(array, left, middle, right)
        }
    }
}


