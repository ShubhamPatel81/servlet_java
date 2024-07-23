package org.sample;
/*
public class swap {
	
	public static void main (String[] args ) {
		
		int nums[] = {5,4,2,3,8,5,6,9};
		int size = nums.length;
		int temp =0 ;
		int minIndex = -1;
		
		System.out.println("Before Swappig");
		for(int num : nums) {
			System.out.print(num + " ");
		}
		System.out.println();
		for(int i = 0 ; i<size-1; i++) {
			minIndex = i;
			for(int j = i+1; j < size; j++) {
				if(nums[minIndex] > nums[j]) 
					minIndex = j;
			}
				temp = nums[minIndex];
				nums[minIndex]  = nums[i];
				nums[i] = temp;
				
				for(int num : nums) {
					System.out.print(num+" ");
				}
				
				System.out.println();
			}
		
		System.out.println("After Sorting");
		for(int num :nums) {
			System.out.print(num + " ");
		}
	}

}*/

//insertion sort 

public class swap {
	
	public static void main (String[] args ) {
		int arr [] = {9,7,5,3,6,8,2,1};
		
		for(int i = 1; i<arr.length ; i++) {
			int key = arr[i];
			int j = i-1;
			
			while(j>=0 && arr[j]>key) {
				arr[j+1] = arr[j];
				j--;
			}
			arr[j+1] = key;
			
		}
		for(int num:arr) {
			System.out.print(num +" ");
		}
		
	  }
	}