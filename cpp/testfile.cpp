#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
    vector<string> msg {"Hello", "C++", "World", "from", "VS Code", "and the C++ extension!"};

    for (const string& word : msg)
    {
        cout << word << " ";
    }
    cout << endl;
}

// leetcode: 704
class Solution {
public:
    int search(vector<int>& nums, int target) {
        int left = 0;
        int right = nums.size() - 1;
        
        while(left<=right){
            int pivot = (left+right)>>1;
            if (nums[pivot] == target){
                return pivot;
            } else if (nums[pivot] < target) {
                left = pivot+1;
            } else {
                right = pivot-1;
            }
        }
        
        return -1;
    }
};