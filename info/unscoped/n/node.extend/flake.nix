{

  inputs.packument.url   = "https://registry.npmjs.org/node.extend?rev=77-6f11800c86606b84c859f0535ce60709";
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
    ident = "node.extend";
    ldir  = "info/unscoped/n/node.extend";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
