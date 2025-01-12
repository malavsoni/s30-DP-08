function minDistance_dfs(word1: string, word2: string): number {
  let memo: number[][] = Array.from({ length: word1.length + 1 }, () =>
    Array(word2.length + 1).fill(Number.MAX_SAFE_INTEGER)
  );
  function commonFinder(i: number, j: number): number {
    if (i == word1.length || j == word2.length) {
      return 0;
    }

    if (memo[i][j] != Number.MAX_SAFE_INTEGER) {
      return memo[i][j];
    }

    let iChar = word1.charAt(i);
    let jChar = word2.charAt(j);

    let result: number = 0;
    if (jChar == iChar) {
      result = 1 + commonFinder(i + 1, j + 1);
    } else {
      result = Math.max(commonFinder(i + 1, j), commonFinder(i, j + 1));
    }

    memo[i][j] = result;

    return result;
  }

  let common = commonFinder(0, 0);
  return word1.length - common + (word2.length - common);
}

function minDistance(word1: string, word2: string): number {
  let dp: number[][] = Array.from({ length: word1.length + 1 }, () =>
    Array(word2.length + 1).fill(0)
  );

  for (let i = 1; i <= word1.length; i++) {
    for (let j = 1; j <= word2.length; j++) {
      let iChar = word1.charAt(i - 1);
      let jChar = word2.charAt(j - 1);

      if (jChar == iChar) {
        dp[i][j] = 1 + dp[i - 1][j - 1];
      } else {
        dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
      }
    }
  }

  let common = dp[word1.length][word2.length];

  return word1.length - common + (word2.length - common);
}

describe("583. Delete Operation for Two Strings", () => {
  it("Happy Path - 01", () => {
    expect(minDistance_dfs("sea", "eat")).toEqual(2);
  });
});
