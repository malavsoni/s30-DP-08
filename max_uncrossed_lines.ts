function maxUncrossedLines_dfs(nums1: number[], nums2: number[]): number {
  let memo: number[][] = Array.from({ length: nums1.length}, () =>
    Array(nums2.length ).fill(Number.MIN_SAFE_INTEGER)
  );
  function dfs(i: number, j: number): number {
    if (i == nums1.length || j == nums2.length) {
      return 0;
    }

    if (memo[i][j] != Number.MIN_SAFE_INTEGER) {
      return memo[i][j];
    }

    let iNum = nums1[i];
    let jNum = nums2[j];

    let result = 0;
    if (iNum == jNum) {
      result = 1 + dfs(i + 1, j + 1);
    } else {
      result = Math.max(dfs(i + 1, j), dfs(i, j + 1));
    }
    memo[i][j] = result;
    return result;
  }
  return dfs(0, 0);
}

function maxUncrossedLines(nums1: number[], nums2: number[]): number {
  let dp: number[][] = Array.from({ length: nums1.length + 1 }, () =>
    Array(nums2.length + 1).fill(0)
  );

  for (let i = 1; i <= nums1.length; i++) {
    for (let j = 1; j <= nums2.length; j++) {
      let iNum = nums1[i - 1];
      let jNum = nums2[j - 1];

      if (iNum == jNum) {
        dp[i][j] = 1 + dp[i - 1][j - 1];
      } else {
        dp[i][j] = Math.max(dp[i][j - 1], dp[i - 1][j]);
      }
    }
  }

  return dp[nums1.length][nums2.length];
}

describe("1035. Uncrossed Lines", () => {
  it("Happy Path - 01", () => {
    expect(maxUncrossedLines_dfs([2, 5, 1, 2, 5], [10, 5, 2, 1, 5, 2])).toEqual(
      3
    );
  });

  it("Happy Path - 01", () => {
    expect(maxUncrossedLines_dfs([1,4,2], [1,2,4])).toEqual(
      2
    );
  });
});
