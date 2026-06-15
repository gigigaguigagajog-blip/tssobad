interface User {
    id: number;
    name: string;
    isActive: boolean;
}

// Filters an array of users to return only the active ones
function getActiveUsers(users: User[]): User[] {
    return users.filter(user => user.isActive);
}

const userList: User[] = [
    { id: 1, name: "Alice", isActive: true },
    { id: 2, name: "Bob", isActive: false },
    { id: 3, name: "Charlie", isActive: true },
];

console.log(getActiveUsers(userList));

