{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@wry%2ftrie?_rev=6-b14dba9563edf1426740a30553fddd79";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@wry";
    ident = "@wry/trie";
    ldir  = "info/wry/trie";
    inherit packument fetchInfo;
  } // latest';

}
