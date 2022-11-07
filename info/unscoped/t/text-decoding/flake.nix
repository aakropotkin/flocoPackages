{

  inputs.packument.url   = "https://registry.npmjs.org/text-decoding?rev=1-3d0357f0373e2b49e6375d3a95833b96";
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
    ident = "text-decoding";
    ldir  = "info/unscoped/t/text-decoding";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
