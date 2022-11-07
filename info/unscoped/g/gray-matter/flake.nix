{

  inputs.packument.url   = "https://registry.npmjs.org/gray-matter?rev=131-589a15430807056c5296bd82dbd7b64b";
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
    ident = "gray-matter";
    ldir  = "info/unscoped/g/gray-matter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
