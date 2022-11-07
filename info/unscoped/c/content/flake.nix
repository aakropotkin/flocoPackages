{

  inputs.packument.url   = "https://registry.npmjs.org/content?rev=112-c71b71219181fe6bf9a870ed78a9f518";
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
    ident = "content";
    ldir  = "info/unscoped/c/content";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
