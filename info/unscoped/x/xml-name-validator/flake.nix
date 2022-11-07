{

  inputs.packument.url   = "https://registry.npmjs.org/xml-name-validator?rev=16-7379295524b0924615650dc5b6cf104a";
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
    ident = "xml-name-validator";
    ldir  = "info/unscoped/x/xml-name-validator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
