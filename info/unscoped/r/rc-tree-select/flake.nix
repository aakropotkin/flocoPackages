{

  inputs.packument.url   = "https://registry.npmjs.org/rc-tree-select?rev=250-b9d702dc58e6b4fbceb0a527d0180a95";
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
    scope = null;
    ident = "rc-tree-select";
    ldir  = "info/unscoped/r/rc-tree-select";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
