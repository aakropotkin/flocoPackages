{

  inputs.packument.url   = "https://registry.npmjs.org/fast-json-stable-stringify?rev=5-835c5033869655fd4613c7940de94228";
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
    ident = "fast-json-stable-stringify";
    ldir  = "info/unscoped/f/fast-json-stable-stringify";
    inherit packument fetchInfo;
  } // latest';

}
