// This is to restore the broken functionality of Vimium not being able to
// go to previous/next tab with Alt, which breaks the consistent navigation
// in tmux, vim, vimium

[
  {
    action: "prevtab",
    blacklist: false,
    exported: true,
    key: "alt+h",
    open: false,
    sites: "*mail.google.com*",
    sitesArray: ["*mail.google.com*"]
  },
  {
    action: "nexttab",
    blacklist: false,
    exported: true,
    key: "alt+l",
    open: false,
    sites: "*mail.google.com*",
    sitesArray: ["*mail.google.com*"]
  }
];
