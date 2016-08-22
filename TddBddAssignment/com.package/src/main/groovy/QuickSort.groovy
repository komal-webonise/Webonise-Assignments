/**
 * Created by webonise on 22/8/16.
 */
class QuickSort {
    public static void swap(int[] arr,int i,int j) {
        int temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
    }
    public static int findPivot(int[] array,int left, int right)
    {
        int pivot = array[(left + right) / 2]
        return pivot
    }
    public static int partition(int[] array,int left,int right) {
        int i = left, j = right
        int pivot = findPivot(array,left , right);
        while (i <= j) {

            while (array[i] < pivot)

                i++

            while (array[j] > pivot)

                j--

            if (i <= j) {

                swap(array, i, j)
                i++
                j--
            }
        }

        return i;

    }

    public static void quickSort(int[] array,int left,int right)
    {

            int index = partition(array, left, right);

            if (left < index - 1)

                quickSort(array, left, index - 1);

            if (index < right)

                quickSort(array, index, right);


    }

    public static void main(String[] args)
    {
        int[] array=[10,9,8,7]
        int l=0
        int r=array.length-1
        QuickSort.quickSort(array,l,r)
        println(array)
    }
}

