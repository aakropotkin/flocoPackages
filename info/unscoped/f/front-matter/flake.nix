{

  inputs.packument.url   = "https://registry.npmjs.org/front-matter?rev=91-b1fa36a97111e0b409f2c6d85d7cdcc2";
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
    ident = "front-matter";
    ldir  = "info/unscoped/f/front-matter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
