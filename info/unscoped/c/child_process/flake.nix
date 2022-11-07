{

  inputs.packument.url   = "https://registry.npmjs.org/child_process?rev=23-df98a8789e20da8a01c6937ac1b11b3b";
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
    ident = "child_process";
    ldir  = "info/unscoped/c/child_process";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
