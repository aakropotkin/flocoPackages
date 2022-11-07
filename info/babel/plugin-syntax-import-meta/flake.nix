{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-import-meta?rev=56-63e9cd7ee905163a2e05c566a842c0e7";
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
    scope = "@babel";
    ident = "@babel/plugin-syntax-import-meta";
    ldir  = "info/babel/plugin-syntax-import-meta";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
