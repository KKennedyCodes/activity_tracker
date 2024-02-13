# Activity Tracker
Allows the user to trigger the following actions:
- Start a Process
- Create, Modify, and Delete Files
- Network Connection and Transmission of Data

A csv log is created after each action performed.

## Technologies
- Ruby

## Supported Operating Systems
- Mac OS

Note: To See Availble Rake Tasks `rake --tasks`


## Running the file:manage Task with Parameters
The `file:manage` Rake task allows you to perform various operations on files, such as creating, updating, or deleting them. It accepts the following parameters:

`file_path`: The path to the file.
`operation`: The operation to perform (-c for create, -u for update, -d for delete).
`content` (optional): The content to write to the file (only required for the create and update operations).
To run the task, use the following command format:

>rake file:manage[file_path, operation, content]

Replace file_path with the path to the file, operation with the desired operation (-c, -u, or -d), and content with the content to write to the file (only for create and update operations).

#### Examples:
To create a file:
> rake file:manage[/path/to/file.txt, -c, "File content"]

To update a file:
> rake file:manage[/path/to/file.txt, -u, "Updated content"]

To delete a file:
> rake file:manage[/path/to/file.txt, -d]

Ensure that you replace /path/to/file.txt with the actual path to the file and provide appropriate content for create and update operations.

#### Processes
- Start a Process
`rake processes:start`

#### Network Connections
- Start a Server
`rake network:connect`

- Transmit Data
`rake network:transmit`

