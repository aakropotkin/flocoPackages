{

  inputs.packument.url   = "https://registry.npmjs.org/lib0?rev=69-5fd0639a0c13af06e84bb48934a019d3";
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
    ident = "lib0";
    ldir  = "info/unscoped/l/lib0";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
