{

  inputs.packument.url   = "https://registry.npmjs.org/http2-wrapper?rev=57-886288f32ad66209c09e8126cea946c4";
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
    ident = "http2-wrapper";
    ldir  = "info/unscoped/h/http2-wrapper";
    inherit packument fetchInfo;
  } // latest';

}
