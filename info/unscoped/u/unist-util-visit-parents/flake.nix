{

  inputs.packument.url   = "https://registry.npmjs.org/unist-util-visit-parents?rev=27-c45ed4973ca522d74f11301d20f14eb7";
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
    ident = "unist-util-visit-parents";
    ldir  = "info/unscoped/u/unist-util-visit-parents";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
