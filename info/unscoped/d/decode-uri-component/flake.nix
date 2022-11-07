{

  inputs.packument.url   = "https://registry.npmjs.org/decode-uri-component?rev=3-4782b9625ecca851178c7202462a5ae4";
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
    ident = "decode-uri-component";
    ldir  = "info/unscoped/d/decode-uri-component";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
